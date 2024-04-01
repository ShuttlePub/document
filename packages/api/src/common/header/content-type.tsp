import "@typespec/http";

using TypeSpec.Http;

namespace Common.Header.ContentType {
  model ContentType<T> {
    @header
    contentType: T;
  }
  model JsonResourceDescriptor is ContentType<"application/jrd+json; charset=utf-8">;
  model ActivityJson is ContentType<"application/activity+json; charset=utf-8">;
}
