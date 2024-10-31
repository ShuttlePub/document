import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../../common/status-code.tsp";
import "./account.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("metadata")
@route("/metadata/{id}")
namespace Emumet.API.MetadataAPI;

scalar MetadataId extends Common.Types.Nanoid;

model MetadataCreateRequest {
  name: string;
  description: string;
}

model MetadataUpdateRequest {
  name?: string;
  description?: string;
}

model MetadataResponse {
  id: MetadataId;
  name: string;
  description: string;
}

interface Metadatas {
  @summary("Get all metadatas")
  @get
  get(
    @path
    id: AccountAPI.AccountId,
  ):
    | {
        ...StatusCode.Success;

        @body
        body: MetadataResponse[];
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;

  @summary("Create a new metadata")
  @post
  create(
    @path
    id: AccountAPI.AccountId,

    @body
    body: MetadataCreateRequest,
  ):
    | {
        ...StatusCode.Success;

        @body
        body: MetadataId;
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;

  @summary("Update a metadata")
  @patch
  update(
    @path
    id: MetadataId,

    @body
    body: MetadataUpdateRequest,
  ):
    | {
        ...StatusCode.Success;
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;

  @summary("Delete a metadata")
  @delete
  delete(
    @path
    id: MetadataId,
  ):
    | StatusCode.Success
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}
