Ref: http://stackoverflow.com/questions/1138460/how-does-facebook-sharer-select-images


**How do I tell Facebook which image to use when my page gets shared?**

Facebook has a set of open-graph meta tags that it looks at to decide which image to show.

The keys one for the Facebook image are:
```html
<meta property="og:image" content="http://ia.media-imdb.com/rock.jpg"/>
<meta property="og:image:secure_url" content="https://secure.example.com/ogp.jpg" />
```
and it should be present inside the <head></head> tag at the top of your page.

If these tags are not present, it will look for their older method of specifying an image: <link rel="image_src" href="/myimage.jpg"/>. If neither are present, Facebook will look at the content of your page and choose images from your page that meet its share image criteria: Image must be at least 50px by 50px, have a maximum aspect ratio of 3:1, and in PNG, JPEG or GIF format.

Can I specify multiple images to allow the user to select an image?

Yes, you just need to add multiple image meta tags in the order you want them to appear in. The user will then be presented with an image selector dialog:
Facebook Image Selector

I specified the appropriate image meta tags. Why isn't Facebook accepting the changes?

Once a url has been shared, Facebook's crawler, which has a user agent of facebookexternalhit/1.1 (+https://www.facebook.com/externalhit_uatext.php), will access your page and cache the meta information. To force Facebook servers to clear the cache, use the Facebook Url Debugger / Linter Tool that they launched in June 2010 to refresh the cache and troubleshoot any meta tag issues on your page.

Also, the images on the page must be publicly accessible to the Facebook crawler. You should specify absolute url's like http://example.com/yourimage.jpg instead of just /yourimage.jpg.

Can I update these meta tags with client side code like Javascript or jQuery? No. Much like search engine crawlers, the Facebook scraper does not execute scripts so whatever meta tags are present when the page is downloaded are the meta tags that are used for image selection.

Adding these tags causes my page to no longer validate. How can I fix this?

You can add the necessary Facebook namespaces to your tag and your page should then pass validation:
```html
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:og="http://ogp.me/ns#"
      xmlns:fb="https://www.facebook.com/2008/fbml">  
```
