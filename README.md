# Sol文件批量编译工具
### Requirements
* Python >= 3.6
* solcx (pip install py-solc-x)
### 执行过程
1. 将合约压缩文件解压至./contracts
2. 更改pathUpdate.py中数据目录的绝对路径，运行pathUpdate.py以更改sol文件中所有import依赖路径并生成metadata.json文件
3. 更改batchCompile.py中数据及输出目录的绝对路径，运行batchCompile.py进行批量编译

生成的编译文件放在compile_info目录下，若编译失败，异常信息保存在error_info目录下。
目前大多数失败是由于文件夹中不包含.sol文件导致的。

