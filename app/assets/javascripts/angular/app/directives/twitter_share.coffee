angular.module("app.directives.twitter.share", []).directive "tweet", [
  "$window"
  ($window) ->
    return (
      restrict: "A"
      scope:
        tweet: "="
      link: (scope, element, attrs) ->
        # Load Twitter SDK if not already loaded
        renderTweetButton = ->
          if not scope.tweet and not watchAdded
            watchAdded = true
            unbindWatch = scope.$watch("tweet", (newValue, oldValue) ->
              if newValue
                renderTweetButton()

                unbindWatch()
              return
            )
            return
          else
            element.html('<a href="https://twitter.com/share" class="twitter-share-button" data-dnt="true" data-url="' + scope.tweet.url + '" data-via="' + scope.tweet.via + '" data-text="' + scope.tweet.text + '">Tweet</a>')
            $window.twttr.widgets.load element.parent()[0]
          return
        unless $window.twttr
          $.getScript "//platform.twitter.com/widgets.js", ->
            renderTweetButton()
            return
        else
          renderTweetButton()
        watchAdded = false
        return
    )
]
