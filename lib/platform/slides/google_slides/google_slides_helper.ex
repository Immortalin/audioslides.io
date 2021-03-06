defmodule Platform.GoogleSlidesHelper do
  @moduledoc """
  The google slides context
  """

  alias GoogleApi.Slides.V1.Model.Page

  def sha256(data), do: :crypto.hash(:sha256, data)

  @doc """
  Generates a hash for Speakernotes

  Generate Hash from the speaker notes
  iex> generate_hash_for_speakernotes(%Page{slideProperties: %{notesPage: %{"text": "ABC123"}}})
  "0D7FDBE1B2533EC8A3E2911E625CDEFF803669076F992D88B3E3BA094F859B90"

  Other data as speakernotes don't influence this hash
  iex> generate_hash_for_speakernotes(%Page{objectId: "someOtherData", slideProperties: %{notesPage: %{"text": "ABC123"}}})
  "0D7FDBE1B2533EC8A3E2911E625CDEFF803669076F992D88B3E3BA094F859B90"

  If you change the speakernotes, the hash changes too
  iex> generate_hash_for_speakernotes(%Page{slideProperties: %{notesPage: %{"text": "321ABC"}}})
  "AA9C63E9DEFD30BD013470F152F45602FB2621AA28CE408F77323F7240665FE1"

  """
  def generate_hash_for_speakernotes(%Page{slideProperties: %{notesPage: notesPage}}) do
    notesPage
    |> Poison.encode!()
    |> sha256()
    |> Base.encode16()
  end

  @doc """
  Generates a hash for pageElements of a Slide

  Generate a hash for a page
  iex> generate_hash_for_page_elements(%Page{pageElements: [%PageElement{description: "A"}] })
  "A964EE70387C0A9532D3C81B2754FB0D62ECFCFAC8D2EC5119760AC5593C3464"

  If you change something in this page, the hash changes
  iex> generate_hash_for_page_elements(%Page{pageElements: [%PageElement{description: "B"}] })
  "0C8D2536C31320F54769B3D9AF7429E5E8157B79D6C4C1EEB193812D981643FD"

  If you change something else e.g. the speaker notes the hash stay constant for this slide
  iex> generate_hash_for_page_elements(%Page{pageElements: [%PageElement{description: "B"}], slideProperties: %{notesPage: %{"text": "321ABC"}}})
  "0C8D2536C31320F54769B3D9AF7429E5E8157B79D6C4C1EEB193812D981643FD"

  """
  def generate_hash_for_page_elements(%Page{pageElements: page_elements}) do
    page_elements
    |> Poison.encode!()
    |> sha256()
    |> Base.encode16()
  end

  @doc """
  Get speaker notes for a page object

  iex> gslides = get_base_slide(object_id: "objID_1", content: "Example Content 1", speaker_notes: "Speaker Notes 1")
  iex> get_speaker_notes(gslides)
  "Speaker Notes 1"

  iex> notes = ["Speaker Notes 1!!", "Speaker Notes 2!!"]
  iex> gslides = get_base_slide(object_id: "objID_1", content: "Example Content 1", speaker_notes: notes )
  iex> get_speaker_notes(gslides)
  "Speaker Notes 1!!Speaker Notes 2!!"

  """
  def get_speaker_notes(%Page{slideProperties: %{notesPage: notesPage}}) do
    notes_object_id = notesPage.notesProperties.speakerNotesObjectId

    notes_root_element =
      notesPage.pageElements
      |> Enum.find(fn e -> e.objectId == notes_object_id end)

    if notes_root_element.shape.text do
      text_elements =
        notes_root_element.shape.text.textElements
        |> Enum.map(fn e ->
             if e.textRun != nil do
               e.textRun.content
             end
           end)

      Enum.join(text_elements)
    else
      ""
    end
  end

  @doc """

  iex> any_content_changed?(%{speaker_notes_hash: "0D7FDBE1B2533EC8A3E2911E625CDEFF803669076F992D88B3E3BA094F859B90", page_elements_hash: "0C8D2536C31320F54769B3D9AF7429E5E8157B79D6C4C1EEB193812D981643FD"}, %Page{slideProperties: %{notesPage: %{"text": "ABC123"}}, pageElements: [%PageElement{description: "B"}]})
  false

  iex> any_content_changed?(%{speaker_notes_hash: "0D7FDBE1B2533EC8A3E2911E625CDEFF803669076F992D88B3E3BA094F859B90", page_elements_hash: "0C8D2536C31320F54769B3D9AF7429E5E8157B79D6C4C1EEB193812D981643FD"}, %Page{slideProperties: %{notesPage: %{"text": "ABC1234"}}, pageElements: [%PageElement{description: "B"}]})
  true

  iex> any_content_changed?(%{speaker_notes_hash: "0D7FDBE1B2533EC8A3E2911E625CDEFF803669076F992D88B3E3BA094F859B90", page_elements_hash: "0C8D2536C31320F54769B3D9AF7429E5E8157B79D6C4C1EEB193812D981643FD"}, %Page{slideProperties: %{notesPage: %{"text": "ABC123"}}, pageElements: [%PageElement{description: "C"}]})
  true

  """
  def any_content_changed?(slide, google_slide) do
    content_changed_for_speaker_notes?(slide, google_slide) || content_changed_for_page_elements?(slide, google_slide)
  end

  @doc """

  iex> content_changed_for_speaker_notes?(%{speaker_notes_hash: "0D7FDBE1B2533EC8A3E2911E625CDEFF803669076F992D88B3E3BA094F859B90"}, %Page{slideProperties: %{notesPage: %{"text": "ABC123"}}})
  false

  iex> content_changed_for_speaker_notes?(%{speaker_notes_hash: "0D7FDBE1B2533EC8A3E2911E625CDEFF803669076F992D88B3E3BA094F859B90"}, %Page{slideProperties: %{notesPage: %{"text": "ABC123!!"}}})
  true

  """
  def content_changed_for_speaker_notes?(%{speaker_notes_hash: old_hash}, %Page{} = google_slide) do
    new_hash = generate_hash_for_speakernotes(google_slide)

    new_hash != old_hash
  end

  @doc """

  iex> content_changed_for_page_elements?(%{page_elements_hash: "0C8D2536C31320F54769B3D9AF7429E5E8157B79D6C4C1EEB193812D981643FD"}, %Page{pageElements: [%PageElement{description: "B"}] })
  false

  iex> content_changed_for_page_elements?(%{page_elements_hash: "0C8D2536C31320F54769B3D9AF7429E5E8157B79D6C4C1EEB193812D981643FD"}, %Page{pageElements: [%PageElement{description: "C"}] })
  true

  """
  def content_changed_for_page_elements?(%{page_elements_hash: old_hash}, %Page{} = google_slide) do
    new_hash = generate_hash_for_page_elements(google_slide)

    new_hash != old_hash
  end

  @doc """

  iex> get_title(%Page{pageElements: nil})
  "NO TITLE"

  iex> get_title(%Page{pageElements: [%{shape: %{placeholder: %{type: "TITLE"}, text: %{textElements: [%{textRun: %{content: "A Title"}}]}}}]})
  "A Title"

  """
  def get_title(%Page{pageElements: nil}), do: "NO TITLE"

  def get_title(%Page{pageElements: pageElements}) do
    page =
      pageElements
      |> Enum.find(&contains_element_title?(&1))

    get_text_from_page(page)
  end

  @doc """

  iex> get_text_from_page(%{shape: %{placeholder: %{type: "TITLE"}, text: %{textElements: [%{textRun: %{content: "A Title"}}]}}})
  "A Title"

  iex> get_text_from_page(%{shape: %{placeholder: %{type: "TITLE"}, text: %{textElements: [%{textRun: %{content: "Another Title"}}]}}})
  "Another Title"

  iex> get_text_from_page(%{shape: %{placeholder: %{type: "TITLE"}, text: %{}}})
  "NO TITLE"

  """
  def get_text_from_page(%{shape: %{text: %{textElements: elements}}}) do
    text_element =
      elements
      |> Enum.find(fn e -> e.textRun != nil end)

    text_element.textRun.content
  end

  def get_text_from_page(_), do: "NO TITLE"

  @doc """
  Check of there a the correct element for the title

  iex> contains_element_title?(nil)
  false

  iex> example_element = %{}
  iex> contains_element_title?(example_element)
  false

  iex> example_element = %{shape: %{placeholder: %{type: "TITLE"}}}
  iex> contains_element_title?(example_element)
  false

  iex> example_element = %{shape: %{placeholder: %{type: "TITLE"}, text: "Example Title"}}
  iex> contains_element_title?(example_element)
  true

  """
  def contains_element_title?(%{shape: %{placeholder: %{type: "TITLE"}, text: _}}), do: true
  def contains_element_title?(_), do: false

  @doc """
  Extract a presentation_id from a url string

  iex> extract_presentation_id("https://docs.google.com/presentation/d/1tGbdANGoW8BGI-S-_DcP0XsXhoaTO_KConY7-RVFnkM/edit#slide=id.g299abd206d_0_525")
  "1tGbdANGoW8BGI-S-_DcP0XsXhoaTO_KConY7-RVFnkM"

  iex> extract_presentation_id("https://docs.google.com/presentation/d/1tGbdANGoW8BGI-S-_DcP0XsXhoaTO_KConY7-RVFnkM/edit#slide=id.g299abd206d_0_525")
  "1tGbdANGoW8BGI-S-_DcP0XsXhoaTO_KConY7-RVFnkM"

  iex> extract_presentation_id("string-without-valid-id")
  "string-without-valid-id"

  iex> extract_presentation_id(nil)
  nil

  """
  def extract_presentation_id(nil), do: nil

  def extract_presentation_id(input) do
    regex = ~r/(https:\/\/docs\.google\.com\/presentation\/d\/([\s\S]*?)\/)/

    case Regex.run(regex, input) do
      [_, _match, presentation_id] -> presentation_id
      _ -> input
    end
  end
end
