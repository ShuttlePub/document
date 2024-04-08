import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../../common/query";
import "../../common/body";
import "../../common/status-code.tsp";
import "./stellar.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("admin")
@route("/admin")
namespace Emumet.API.AdminAPI;

model ModerationInformation {
  comment: string;
}

@route("/accounts")
namespace Accounts {
  @summary("Get all of accounts in this service")
  @get
  op get(...Query.ArrayLimitQueries):
    | {
        ...StatusCode.Success;

        @body
        body: Common.Body.ArrayLimitedResponse<AccountAPI.AccountId>;
      }
    | StatusCode.BadRequest
    | StatusCode.Forbidden
    | StatusCode.InternalError;

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
          body: Common.Body.ArrayLimitedResponse<SuspendResponse<StellarAPI.StellarId>>;
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

@route("/stellar")
namespace Stellar {
  model StellarModrationInformation is ModerationInformation {
    host: url;
  }

  model StellarBlockRequest is StellarModrationInformation;

  model StellarBlockResponse<ModeratorId> is StellarModrationInformation {
    moderated_by: ModeratorId;
    created_at: utcDateTime;
  }

  @route("/operators")
  namespace Operators {
    scalar RoleName extends string;
    model Role {
      role: RoleName;
    }
    model RoleRequest is Role;
    model RoleResponse is Role;

    @get
    op get(...Query.ArrayLimitQueries, @query target_role?: RoleName):
      | {
          ...StatusCode.Success;

          @body
          body: Common.Body.ArrayLimitedResponse<StellarAPI.StellarId>;
        }
      | StatusCode.BadRequest
      | StatusCode.Forbidden
      | StatusCode.InternalError;

    @route("/{id}")
    interface Operator {
      @get
      get(@path id: StellarAPI.StellarId):
        | {
            ...StatusCode.Success;

            @body
            body: RoleResponse;
          }
        | StatusCode.BadRequest
        | StatusCode.Forbidden
        | StatusCode.NotFound
        | StatusCode.InternalError;
      @post
      post(@path id: StellarAPI.StellarId, @body body: RoleRequest):
        | StatusCode.Success
        | StatusCode.BadRequest
        | StatusCode.Forbidden
        | StatusCode.NotFound
        | StatusCode.InternalError;

      @delete
      delete(@path id: StellarAPI.StellarId):
        | StatusCode.Success
        | StatusCode.BadRequest
        | StatusCode.Forbidden
        | StatusCode.NotFound
        | StatusCode.InternalError;
    }
  }

  @route("/block")
  interface Block {
    @get
    get(...Query.ArrayLimitQueries):
      | {
          ...StatusCode.Success;
          host: Common.Body.ArrayLimitedResponse<StellarBlockResponse<StellarAPI.StellarId>>;
        }
      | StatusCode.BadRequest
      | StatusCode.Forbidden
      | StatusCode.InternalError;

    @post
    post(host: StellarBlockRequest):
      | StatusCode.Success
      | StatusCode.BadRequest
      | StatusCode.Forbidden
      | StatusCode.InternalError;

    @delete
    delete(host: url):
      | StatusCode.Success
      | StatusCode.BadRequest
      | StatusCode.Forbidden
      | StatusCode.NotFound
      | StatusCode.InternalError;
  }
}
