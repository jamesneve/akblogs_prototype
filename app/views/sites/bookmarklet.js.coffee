(
  addURL: (aURL) ->
    title = encodeURIComponent(document.title)
    url = encodeURIComponent(document.location)
    target = "http://localhost:3000/sites/new?name=" + title + "&url=" + url + "&rss=" + encodeURIComponent(aURL)
    location.href = target

  formatURL: (feedURL, aDocument) ->
    newURL = feedURL
    location = aDocument.location
    unless feedURL.indexOf("/") is 0
      splitURL = location.pathname.split("/")
      splitURL[splitURL.length - 1] = feedURL
      newURL = splitURL.join("/")
    location.protocol + "//" + location.hostname + newURL

  checkForFeeds: ->
    feedExists = false
    links = document.getElementsByTagName("link")
    link = undefined
    i = 0

    while link = links[i]
      linkType = link.getAttribute("type")
      linkRel = link.getAttribute("rel")
      if linkType and linkType.match(/[\+\/]xml$/) and linkRel and linkRel is "alternate"
        feedURL = link.getAttribute("href")
        feedURL = @formatURL(feedURL, document) unless feedURL.indexOf("http") is 0
        @addURL feedURL
        feedExists = true
        break
      i++
    @addURL "" unless feedExists
).checkForFeeds()
