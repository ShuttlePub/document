import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

@service({
    title: "Emumet REST API",
})
@server("/", "Emument flagship server endpoint")
namespace Emumet;