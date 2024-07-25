require('java').setup(
 {
  root_markers = {
    '.git',
    'mvnw',
    'gradlew',
    'pom.xml',
  },
  java_test = {
    enable = false,
  },
  java_debug_adapter = {
    enable = false,
  },
  spring_boot_tools = {
    enable = false,
  },
  jdk = {
    auto_install = true,
  },
  notifications = {
    dap = false,
  },
  verification = {
    invalid_order = true,
    duplicate_setup_calls = true,
    invalid_mason_registry = true,
  },
})

require('lspconfig').jdtls.setup({
  settings = { 
    java = { 
      configuration = { 
	  runtimes = { 
	             { 
	               	name = "corretto-17", 
			path = "C:\\Users\\MOPPO-00\\.jdks\\corretto-17.0.7\\bin", 
			default = true, 
		    }, 
		}, 
          },
       }
   }
})

