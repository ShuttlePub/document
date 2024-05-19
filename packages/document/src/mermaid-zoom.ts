import ExecutionEnvironment from "@docusaurus/ExecutionEnvironment";
import * as d3 from "d3";

if (ExecutionEnvironment.canUseDOM) {
    let called = false
    window.addEventListener("click", function () {
        if (called) return;
        called = true
        const svgs = d3.selectAll(".docusaurus-mermaid-container svg");
        console.log("svgs", svgs)
        svgs.each(function() {
            const svg = d3.select(this);
            svg.html("<g>" + svg.html() + "</g>");
            const inner = svg.select("g");
            const zoom = d3.zoom().on("zoom", function(event) {
                inner.attr("transform", event.transform);
            });
            svg.call(zoom);
        });
    });
}
