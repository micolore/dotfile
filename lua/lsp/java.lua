require('java').setup(
 {
  root_markers = {
    'settings.gradle',
    'settings.gradle.kts',
    'pom.xml',
    'build.gradle',
    'mvnw',
    'gradlew',
    'build.gradle',
    'build.gradle.kts',
    '.git',
  },

  java_test = {
    enable = true,
  },

  java_debug_adapter = {
    enable = true,
  },

  spring_boot_tools = {
    enable = false,
  },

  jdk = {
    auto_install = true,
  },

  notifications = {
    dap = true,
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

