# json2property
复制json文本到剪贴板，然后就可以“粘贴成property”
```
- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo {
    //获取鼠标选中的字符串
    NSArray *arr = (NSArray *)input;
    NSString *string = [NSString stringWithFormat:@"%@",arr.firstObject];
    
    //字符串转字典
    NSDictionary *dic = [NSDictionary dictionaryWithString:string];
    
    //字典中遍历出相关字段，生成property
    [NSString findPropertyWithDic:dic];
    
    //合并生成最终需要的字符串
    NSString *result = [NSString allProperty];
    
    //原本我希望通过以下代码，直接将结果放到剪贴板上。但测试发现以下代码无效。所以只能在Automator中通过AppleScript创建一个新的action
//    [[NSPasteboard generalPasteboard] declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:nil];
//    [[NSPasteboard generalPasteboard] clearContents];
//    [[NSPasteboard generalPasteboard] setString:result forType:NSStringPboardType];
    
    //AppleScript代码如下：
//    on run {input, parameters}
//    set the clipboard to (input as string)
//    end run
    
    return result;
}
```
