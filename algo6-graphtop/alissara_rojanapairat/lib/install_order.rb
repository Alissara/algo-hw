# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
  result = []

  hash_pkg = Hash.new {|k,v| v = []}

  arr.each do |tup|
    hash_pkg[tup[0]] += [tup[1]]
  end

  (1..hash_pkg.keys.max).each do |pkg|
    result << pkg unless hash_pkg.keys.include?(pkg)
  end


  until hash_pkg.empty?
    hash_pkg.each do |pkg, dep|
      if dep.all? {|d| result.include?(d)}
        result << pkg
        hash_pkg.delete(pkg)
      end
    end
  end

  result
end
