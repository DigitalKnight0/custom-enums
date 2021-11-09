module Enumerables

    def my_each
       return self unless block_given?
       
       for i in self

        yield i
       end
    end

    def my_each_with_index
        return self unless block_given?

        for i in self
            yield(i, self.index(i))
        end
    end

    def my_collect
        return self  unless block_given?
        arr = []
        for i in self
            if yield(i)
             arr.push(i)
            end
        end
        return arr
    end

    def my_all?(value = nil)
       return true unless !(value.nil?) || block_given?
       
       unless value.nil? 
         for i in self
            return false unless i == value
         end
         return true
       end

        if block_given?
          for i in self
            return false unless yield(i)
          end
          return true
        end  
    end

    def my_any?(value = nil)
        return true unless !(value.nil?) || block_given?
        
        unless value.nil? 
          for i in self
             return true if i == value
          end
          return false
        end
 
         if block_given?
           for i in self
             return true if yield(i)
           end
           return false
         end  
     end


    def my_none?(value = nil)
        return true unless !(value.nil?) || block_given?
        
        unless value.nil? 
          for i in self
             return false if i == value
          end
          return true
        end
 
         if block_given?
           for i in self
             return false if yield(i)
           end
           return true
         end  
     end

     def my_count(value = nil)
        return self.length unless !(value.nil?) || block_given?
        count = 0
        unless value.nil? 
          for i in self
             count += 1 if i == value
          end
          return count
        end
 
         if block_given?
           for i in self
             count += 1 if yield(i)
           end
           return count
         end  
     end
    
     def my_map
        return self unless block_given?
        arr = []
        for i in self
            arr.push(yield(i))
        end
        return arr
    end


     def my_inject
         sum = 0
         sum = '' if self[0].is_a?(String)
         my_each { |item| sum = yield(sum, item) }
         sum
     end

end