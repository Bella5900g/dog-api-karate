function fn() {
  var config = {};
  config.validateDogImageUrl = function(url) {
    return url && url.match(/^https:\/\/images\.dog\.ceo\/breeds\/.+\.jpg$/);
  };
  return config;
} 