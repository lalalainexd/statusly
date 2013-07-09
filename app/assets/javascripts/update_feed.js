var updateFeedList = function(data) {
  console.log(data);
  var i, item,
      feedItems = data.feed_items,
      $listItem = $('<li></li>');

  for(i = feedItems.length-1; i >= 0; i--) {
    item = feedItems[i];

    console.log(item.created_at);
    console.log(item.user.username);
    console.log(item.text);

    $listItem.attr('data-timestamp', item.created_at);
    $listItem.text(item.user.username+': '+item.text);
    $('ul#feed').prepend($listItem);
  }

};

var getNewFeedItems = function(event) {
  var latestItem, data;

  latestItem = $('ul#feed li:first').data();

  if(latestItem){
    console.log("XXXX");
    console.log(latestItem.timestamp);
    data = {after: latestItem.timestamp};
    $.get('/feed_items', data, updateFeedList);
  }

};

window.setInterval( getNewFeedItems, 5000 );
