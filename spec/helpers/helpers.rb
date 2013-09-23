Bacon::Context.class_eval do
  extend Bacon::Functional::API
  Object.class_eval { include Facon::Mockable }
  include Facon::Baconize::ContextExtensions
  Should.class_eval { include Facon::Baconize::ShouldExtensions }
end