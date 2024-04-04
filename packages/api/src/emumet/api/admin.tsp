import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../../common/query";
import "../../common/status-code.tsp";
import "./stellar.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("admin")
@route("/admin")
namespace Emumet.API.AdminAPI;

@route("/accounts")
namespace Accounts {
  @summary("Get all of accounts in this service")
  @get
  op get(...Query.ArrayLimitQueries):
    | {
        ...StatusCode.Success;

        @body
        accounts: AccountAPI.AccountId[];
      }
    | StatusCode.BadRequest
    | StatusCode.Forbidden
    | StatusCode.InternalError;

  model ModerationInformation {
    comment: string;
  }

  model SuspendRequest is ModerationInformation;

  model SuspendResponse<ModeratorId> is ModerationInformation {
    moderated_by: ModeratorId;
    created_at: utcDateTime;
  }

  @route("/{id}/suspend")
  interface Suspend {
    @get
    get(...Query.ArrayLimitQueries, @path id: AccountAPI.AccountId):
      | {
          ...StatusCode.Success;

          @body
          body: SuspendResponse<StellarAPI.StellarId>;
        }
      | StatusCode.BadRequest
      | StatusCode.Forbidden
      | StatusCode.NotFound
      | StatusCode.InternalError;

    @post
    post(@path id: AccountAPI.AccountId, @body body: SuspendRequest):
      | StatusCode.Success
      | StatusCode.BadRequest
      | StatusCode.Forbidden
      | StatusCode.NotFound
      | StatusCode.Conflict
      | StatusCode.InternalError;

    @doc("Unsuspend account")
    @delete
    delete(@path id: AccountAPI.AccountId):
      | StatusCode.Success
      | StatusCode.BadRequest
      | StatusCode.Forbidden
      | StatusCode.NotFound
      | StatusCode.InternalError;
  }
}
