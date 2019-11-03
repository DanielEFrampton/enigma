class CommandLineInterface

  def parse_argv(argv)
    {  input_path: argv[0],
       output_path: argv[1],
       key: argv[2],
       date: argv[3]
    }
  end
end
