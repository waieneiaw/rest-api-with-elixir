defmodule RestApi.JsonUtils do
  @moduledoc """
  JSON Utilities
  """

  # Defining a implementation for the Jason.Encode for BSON.ObjectId
  defimpl Jason.Encoder, for: BSON.ObjectId do
    @doc """
    Extend BSON to encode MongoDB ObjectIds to string
    """
    @spec encode(BSON.ObjectId.t(), Jason.Encode.opts()) :: iodata
    # Implementing a custom encode function
    def encode(id, options) do
      # Converting the binary id to a string
      BSON.ObjectId.encode!(id)
      # Encoding the string to JSON
      |> Jason.Encoder.encode(options)
    end
  end

  def normaliseMongoId(doc) do
    doc
    |> Map.put("id", doc["_id"])
    |> Map.delete("_id")
  end
end
