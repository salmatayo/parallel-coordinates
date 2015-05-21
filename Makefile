all: d3.parcoords.js

TARGETS= \
	start.js \
	pc.js \
	render.js \
	renderer/renderer.js \
	renderer/canvas.js \
	renderer/webgl.js \
	events.js \
	autoscale.js \
	dimensions.js \
	bundling.js \
	styles.js \
	clear.js \
	axis.js \
	brushes/brushmode.js \
	brushes/1D.js \
	brushes/2D.strums.js \
	brushes/1D.multi.js \
	interactive.js \
	version.js \
	end.js \
	renderQueue.js

d3.parcoords.js: $(addprefix src/, $(TARGETS))
	cat $^ >$@

%.min.js: %.js
	uglifyjs -o $@ $<
	echo >> $@


test:
	@npm test

clean:
	rm -f d3.parcoords.js

.PHONY: clean test
