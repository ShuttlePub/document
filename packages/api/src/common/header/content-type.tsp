import "@typespec/http";

using TypeSpec.Http;

namespace Common.Header.ContentType {
  model JsonResourceDescriptor {
    @header
    contentType: "application/jrd+json; charset=utf-8";
  }
}
