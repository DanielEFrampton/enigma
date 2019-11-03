class Crack < CommandLineInterface
  def parse_argv(argv)
    super.merge({
      key: argv[2],
      date: argv[3]
    })
  end
end
