Package.describe({
  summary: "Plug issue tracking into your application"
});

Package.on_use(function (api, where) {
	
	var both = ['client', 'server'];

  // CLIENT and SERVER
  api.use([
    'coffeescript',
    'collection2',
    'iron-router',
    'just-i18n'
  ], ['client', 'server']);

  api.add_files('shared/i18n/en.coffee', both);
  api.add_files('shared/i18n/es.coffee', both);
  api.add_files(['shared/router.coffee'], both);
  api.add_files('shared/collections.coffee', both);

  // CLIENT
  api.use([
    'deps',
    'service-configuration',
    'underscore',
    'templating',
    'handlebars',
    'spark',
    'session',
    'less',
    'autoform'
  ], 'client');
  
  api.add_files('client/views/issues.html', 'client');
  api.add_files('client/views/issues.coffee', 'client');
  api.add_files('client/templateHelpers.coffee', 'client');

  // SERVER
  api.add_files('server/setup.coffee', 'server');
  api.export('SetupIssues', ['server']);

});

Package.on_test(function (api) {
//  api.use('issues');  
});
