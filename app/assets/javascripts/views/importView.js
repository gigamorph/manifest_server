(function (root) {

  root.views.importView = {
    init: function () {
      $('.mf_beautify_json').click(function (ev) {
        var $jsonInput = $('.mf_json');
        var parsed = JSON.parse($jsonInput.val());
        var pretty = JSON.stringify(parsed, null, 2);
        $jsonInput.val(pretty);
      });
      $('.mf_clear').click(function (ev) {
        $('.mf_json').val('')
      });
    }
  };

})(mf);
