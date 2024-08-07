
if (os_browser != browser_not_a_browser)
{
	if (browser_width != width || browser_height != height)
    {
		width = browser_width;
		height = browser_height;
		resize_app(base_width, base_height, width, height);
	}
}
