import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../../common/query";
import "../../common/status-code.tsp";
import "./account.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("follow_request")
@route("/follow_requests/{account_id}")
namespace Emumet.API.FollowRequestAPI;

interface FollowRequests {
  @summary("Get follow requests")
  @get
  getFollowRequests(
    ...Query.ArrayLimitQueries,
    @path
    account_id: AccountAPI.AccountId,
  ):
    | {
        ...StatusCode.Success;

        @body
        follow_requests: AccountAPI.AccountId[];
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}

@route("/{target_id}")
interface FollowRequest {
  @summary("Follow(request or accept) user")
  @post
  follow(
    @path
    account_id: AccountAPI.AccountId,

    @path
    target_id: AccountAPI.AccountId,
  ):
    | StatusCode.Success
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.Conflict;

  @summary("Unfollow(or reject) user")
  @delete
  unfollow(
    @path
    account_id: AccountAPI.AccountId,

    @path
    target_id: AccountAPI.AccountId,
  ):
    | StatusCode.Success
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.Conflict;
}
