import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../../common/status-code.tsp";
import "./account.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("profile")
@route("/profiles/{id}")
namespace Emumet.API.ProfileAPI;

model ProfileCreateRequest {
  display_name: string;
  summary: string;
  icon: bytes;
  banner: bytes;
}

model ProfileUpdateRequest {
  display_name?: string;
  summary?: string;
  icon?: bytes;
  banner?: bytes;
}

model ProfileResponse {
  display_name: string;
  summary: string;
  icon: url;
  banner: url;
}

interface Profiles {
  @summary("Get a profile")
  @get
  get(@path id: AccountAPI.AccountId): {
    ...StatusCode.Success;
    @body body: ProfileResponse;
  } | StatusCode.NotFound | StatusCode.InternalError;

  @summary("Create a profile")
  @post
  create(@path id: AccountAPI.AccountId, @body request: ProfileCreateRequest):
    | StatusCode.Success
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;

  @summary("Update a profile")
  @patch
  update(@path id: AccountAPI.AccountId, @body request: ProfileUpdateRequest):
    | StatusCode.Success
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}
