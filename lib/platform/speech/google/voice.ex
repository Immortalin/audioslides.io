defmodule Platform.Speech.Google.Voice do
  @moduledoc """
  The Speech context
  """

  @doc """

  iex> get_voice(voice_gender: "male", language: "de-DE")
  "de-DE-Standard-A"

  iex> get_voice(voice_gender: "female", language: "de-DE")
  "de-DE-Standard-B"

  iex> get_voice(voice_gender: "male", language: "en-US")
  "en-US-Wavenet-A"

  iex> get_voice(voice_gender: "female", language: "en-US")
  "en-US-Wavenet-C"

  """
  def get_voice([voice_gender: "male", language: "de-DE"]), do: "de-DE-Standard-A"
  def get_voice([voice_gender: "female", language: "de-DE"]), do: "de-DE-Standard-B"
  def get_voice([voice_gender: "male", language: "en-US"]), do: "en-US-Wavenet-A"
  def get_voice([voice_gender: "female", language: "en-US"]), do: "en-US-Wavenet-C"
end