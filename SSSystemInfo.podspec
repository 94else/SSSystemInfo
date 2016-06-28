Pod::Spec.new do |s|
    s.name         = 'SSSystemInfo'
    s.version      = '0.0.1'
    s.summary      = 'Log'
    s.homepage     = 'https://github.com/94else/SSSystemInfo'
    s.license      = 'MIT'
    s.authors      = {'94else' => '339349330@qq.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/94else/SSSystemInfo.git', :tag => s.version}
    s.source_files =  [
        'SSSystemInfo/*.{h,m}', 
    ]                                           #代码源文件地址，**/*表示Classes目录及其子目录下所有文件，如果有多个目录下则用逗号分开
    s.public_header_files = 'SSSystemInfo/*.h'   #公开头文件地址
#    s.resource     = ['pefine.plist']
    s.requires_arc = true
end