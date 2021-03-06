addFramebuffer(this, "g_buffer", {
	width = 512,
	height = 512,
	renderbuffers = {
		{ format = "rgba8" },
		{ format = "rgba8" },
		{ format = "rgba8" },
		{ format = "depth24stencil8" }
	}
})


local DEFAULT_RENDER_MASK = 1
function render()
	main_view = newView(this, "MAIN", "g_buffer", DEFAULT_RENDER_MASK)
		setPass(this, "DEFERRED")
		enableDepthWrite(this)
		enableRGBWrite(this)
		clear(this, CLEAR_ALL, 0xff00ffff)
		applyCamera(this, "main")
		setActiveGlobalLightUniforms(this)
		renderModels(this)
end

