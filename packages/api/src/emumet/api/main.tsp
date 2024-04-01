import "@typespec/http";
import "./account.tsp";
import "./profile.tsp";

using TypeSpec.Http;

@useAuth(BearerAuth)
@route("/api/[apiVersion]")
namespace Emumet.API;
