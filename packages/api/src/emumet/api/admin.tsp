import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "./account.tsp";
import "../../common/query";
import "../../common/status-code.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("admin")
@route("/admin")
namespace Emumet.API.AdminAPI;

model ModerationInformation {
    moderated_by: AccountAPI.AccountId;
    comment: string;
}

@route("/accounts")
namespace Accounts {
  @doc("Get all of accounts in this service")
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

  @route("/{id}")
  namespace Account {
    @doc("Get account by id")
    @get
    op get(@path id: AccountAPI.AccountId):
      | {
          ...StatusCode.Success;

          @body
          account: AccountAPI.Account;
        }
      | StatusCode.BadRequest
      | StatusCode.Forbidden
      | StatusCode.NotFound
      | StatusCode.InternalError;


      model SuspendRequest is ModerationInformation;

      model SuspendResponse is ModerationInformation {
        created_at: utcDateTime;
      }

    @route("/suspend")
    interface Suspend {
      @get
      get(...Query.ArrayLimitQueries, @path id: AccountAPI.AccountId):
        | {
            ...StatusCode.Success;

            @body
            body: SuspendResponse;
          }
        | StatusCode.BadRequest
        | StatusCode.Forbidden
        | StatusCode.NotFound
        | StatusCode.InternalError;

      @post
      post(
        @path id: AccountAPI.AccountId, 
        @body body: SuspendRequest
        ):
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
}
