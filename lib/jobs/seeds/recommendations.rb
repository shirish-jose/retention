module Jobs
  module Seeds
    class Recommendations

      def perform
        i = 0
        User.select(:id).group(:id).joins(:purchases).find_each do |user|
          Services::Recommend.new(user.id).perform!
          p i+= 1
        end
      end
    end
  end
end