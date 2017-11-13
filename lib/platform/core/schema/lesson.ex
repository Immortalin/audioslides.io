defmodule Platform.Core.Schema.Lesson do
  @moduledoc """
  The lesson schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Platform.Accounts.Schema.User
  alias Platform.Core.Schema.Slide
  alias Platform.Core.Schema.Course

  schema "lessons" do
    field :google_presentation_id, :string
    field :name, :string
    field :voice_gender, :string
    field :voice_language, :string
    field :synced_at, :utc_datetime
    timestamps()

    many_to_many :courses, Course, join_through: "courses_lessons"
    has_many :slides,  Slide, on_delete: :delete_all
    belongs_to :user, User
  end

  @doc false
  def changeset(%__MODULE__{} = lesson, attrs) do
    lesson
    |> cast(attrs, [:google_presentation_id, :name, :voice_language, :voice_gender])
    |> validate_required([:google_presentation_id, :name, :voice_language, :voice_gender])
    |> validate_inclusion(:voice_language, ["de-DE", "en-US"])
    |> validate_inclusion(:voice_gender, ["female", "male"])
  end
end
