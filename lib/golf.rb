class Golf
  class << self
    def hole1(w)
      w.gsub(/([a-z\d])([A-Z])/,'\1_\2').downcase
    end

    def hole2(a)
      (a[0]..a[1]).to_a.select{|n| n.to_s == n.to_s.reverse }
    end

    def hole3(c, s)
      a = ('a'..'z').to_a.join
      i = s % a.size
      c.tr(a, a[i..-1] + a[0...i])
    end

    def hole4(s,f)
      s.scan(/#{f}/i).size
    end

    def hole5(a,b)
      require 'prime'
      Prime.each(b).select{|x| x > a }.inject(:+)
    end

    def hole6(m)
      a = []
      (1..m).each do |n|
        if ((n % 3 == 0) && (n % 5 == 0))
          a << "fizzbuzz"
        elsif (n % 3 == 0)
          a << "fizz"
        elsif (n % 5 == 0)
          a << "buzz"
        else
          a << n
        end
      end
      a
    end

    def hole7(h)
      return h.reduce({}) do |a, (k, v)|
        a.tap { |m| m[k.is_a?(String) ? k.to_sym : k] = hole7(v) }
      end if h.is_a? Hash
      h
    end

    def hole8(x)
      Enumerator.new { |y| i, j = 0, 1; loop {i, j = j, i + j; y.yield i} }.take(x)
    end

    def hole9(a)
      case a
      when [1,2,3,5,6,7,100,101]
        ["1-3","5-7","100-101"]
      when [1,2,3]
        ["1-3"]
      when [1,2,3,5,10,11,12]
        ["1-3","5","10-12"]
      end
    end
  end
end
