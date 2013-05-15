app = angular.module("Article", ["ngResource"])

app.factory "Articleres", ["$resource", ($resource) ->
  $resource("/articles/:id", {id: "@id"}, {update: {method: "PUT"}})
]
app.factory "Sourceres", ["$resource", ($resource) ->
  $resource("/sources/:id", {id: "@id"}, {update: {method: "PUT"}})
]

app.factory "Categoryres", ["$resource", ($resource) ->
  $resource("/categories/:id", {id: "@id"}, {update: {method: "PUT"}})
]



@ArticleCtrl = ["$scope", "Articleres", ($scope, Articleres) ->
  $scope.activeSource = null
  $scope.activeCategory = null
  $scope.articles = Articleres.query()
  $scope.showall = (source) ->
    console.log("showall")
    $scope.activeSource = null
    $scope.activeCategory = null
    $scope.articles = Articleres.query() 
  $scope.refresh = (source) ->
    $scope.activeSource = source
    unless $scope.activeCategory is null
      $scope.articles = Articleres.query(
        "q[source_cont]": source.name
        "q[category_cont]": $scope.activeCategory.name
      )
    else
      $scope.articles = Articleres.query("q[source_cont]": source.name)
  $scope.refreshCate = (category) ->
    console.log("recate")
    console.log($scope.activeSource==null)
    $scope.activeCategory = category
    unless $scope.activeSource is null
      console.log($scope.activeSource.name)
      $scope.articles = Articleres.query(
        "q[source_cont]": $scope.activeSource.name
        "q[category_cont]": category.name
      )
    else
      console.log("something")
      $scope.articles = Articleres.query({"q[category_cont]": category.name})
]


@SourceCtrl = ["$scope", "Sourceres", ($scope, Sourceres) ->
  $scope.sources = Sourceres.query()
  $scope.addEntry = ->
    entry = Sourceres.save($scope.newEntry)
    $scope.sources.push(entry)
    $scope.newEntry = {}
]

@CategoryCtrl = ["$scope", "Categoryres", ($scope, Categoryres) ->
  $scope.categories = Categoryres.query()
]