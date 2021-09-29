local skynet = require "skynet"
local co     = require("skynet.coroutine")
skynet.start(
    function()
        skynet.fork(
            function()
                while true do
                    skynet.sleep(100)
                    print(co.thread(), "wakeup by timer")
                    skynet.wakeup("wait")
                    skynet.wakeup("1000")
                end
            end)
        skynet.fork(
            function()
                while true do
                    skynet.wait("wait")
                    print(co.thread(), "wakeup by other thread")
                end
            end)
        skynet.fork(
            function()
                while true do
                    local r = skynet.sleep(1000, "1000")
                    print(co.thread(), "wakeup by ", r)
                end
            end)
    end)
