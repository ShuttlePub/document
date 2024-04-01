namespace Common.ActivityStreams;

model Image {
  type: "Image";
  url: url;
  mediaType?: string = "image/png";
  sensitive?: boolean = false;
  name?: string;
}
