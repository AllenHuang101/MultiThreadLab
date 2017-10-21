# MultiThreadLab

1. Concurrent 佇列   
   Concurrent 佇列可以容納多個執行緒，async() 區塊內的函式會讓  
   iOS 產生一個新的執行緒來執行區塊內的程式碼。  
   
2. Serial 佇列  
   Serial 佇列，同一個佇列中的程式碼都是在同一個執行緒中執行，  
   不同Serial 佇列的程式才會在不同執行緒中執行。  
   
**3. Semaphore 號誌**  
   控制區某個區塊一次只允許一個執行緒進入執行

   ```swift
   let semaphore = DispatchSemaphore(value: 1)
   //永久等待，直到Dispatch Semaphore的計數值 >= 1
   semaphore.wait()
   //發信號，使原來的信號數值加1
   semaphore.signal()
   ```
   
