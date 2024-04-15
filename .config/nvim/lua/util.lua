function is_in_jest_test(current_path)
  return ends_with_extension(current_path, '.test.js') or ends_with_extension(current_path, '.spec.js')
end

function is_in_cypress_test(current_path)
  return ends_with_extension(current_path, '.cy.jsx')
end

function is_in_test(current_path)
  return is_in_cypress_test(current_path) or is_in_jest_test(current_path)
end

function trim_newline(str)
  return string.gsub(str, '\n', '')
end

function ends_with_extension(str, extension)
  local location = string.find(str, extension)
  return location ~= nil
end
