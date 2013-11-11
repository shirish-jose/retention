module Jobs
  module Seeds
    class Base
      attr_accessor :file_path

      # @param [Array<String>] fields
      def create_record(fields)
        raise(NotImplementedError)
      end

      def perform
        self.class.parse_tsv_file(file_path) do |fields|
          create_record(fields)
        end
      end

      # @param  [String] file_path
      # @return [Block]
      def self.parse_tsv_file(file_path)
        file = open(file_path)
        while(line = file.gets)
          yield(line.split("\t").map(&:strip))
        end
      ensure
        file.close if file
      end
    end
  end
end