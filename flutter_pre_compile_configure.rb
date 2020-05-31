
def add_pre_compile_script()
# current_directory_pathname = Pathname.new __dir__
# project_directory_pathname = Pathname.new Dir.pwd
# relative = current_directory_pathname.relative_path_from project_directory_pathname


# flutter_export_environment_path = File.join('${SRCROOT}', relative, 'flutter_export_environment.sh');
 script_phase :name => 'Run Flutter Build Script',
   :script => "echo '你好'",
   :input_files => [
#     File.join('${SRCROOT}', flutter_application_path, '.metadata'),
#     File.join('${SRCROOT}', relative, 'App.framework', 'App'),
#     File.join('${SRCROOT}', relative, 'engine', 'Flutter.framework', 'Flutter'),
#     flutter_export_environment_path
   ],
   :execution_position => :before_compile
end
