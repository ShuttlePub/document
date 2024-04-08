import "@typespec/http";
import "./account.tsp";
import "./admin.tsp";
import "./follow_request.tsp";
import "./metadata.tsp";
import "./profile.tsp";
import "./stellar.tsp";

using TypeSpec.Http;

@useAuth(BearerAuth)
@route("/api/[apiVersion]")
namespace Emumet.API;
