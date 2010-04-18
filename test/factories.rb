Factory.define :user do |u|
  u.login 'bob'
  u.password 'letmein'
  u.email 'bob@example.com'
end

Factory.define :word do |w|
  w.term 'Aloha'
  w.definition 'Hello'
  w.word_in_context 'Aloha, bruddah'
end

Factory.define :email_subscription do |es|
  es.email 'bob@example.com'
end
