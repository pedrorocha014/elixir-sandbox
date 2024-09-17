defmodule TodoService do
    use GenServer

    # client

    def start() do
        GenServer.start_link(__MODULE__, nil)
    end

    def add(pid, key, value) do
        GenServer.call(pid, {:add, key, value})
    end

    def get(pid, key) do
        GenServer.call(pid, {:get, key})
    end

    def get_many(pid) do
        GenServer.call(pid, :get_many)
    end

    # server

    def init(_) do
        {:ok, %{}}
    end

    def handle_call({:add, key, value}, _from, map) do
        new_map = Map.put(map, key, value)
        {:reply, {key, value}, new_map}
    end

    def handle_call({:get, key}, _from, map) do
        {:reply, Map.get(map, key), map}
    end

    def handle_call(:get_many, _from, map) do
        {:reply, map, map}
    end
end


defmodule TodoCache do
    use GenServer

    # client

    def start() do
        GenServer.start_link(__MODULE__, nil)
    end

    def server_process(cache_pid, server_name) do
        GenServer.call(cache_pid, {:server_process, server_name})
    end

    # server

    def init(_) do
        {:ok, %{}}
    end

    def handle_call({:server_process, server_name}, _from, servers) do
        case Map.fetch(servers, server_name) do
            {:ok, server}   ->
                {:reply, server, servers}
            :error  ->
                {:ok, new_server} = TodoService.start()

                {
                    :reply,
                    new_server,
                    Map.put(servers, server_name, new_server)
                }
        end
    end

end

{:ok, cache_pid} = TodoCache.start

TodoCache.server_process(cache_pid, :pedro)

TodoCache.server_process(cache_pid, :pedro)
|> TodoService.add(:estudar, "estudar elixir até o final do ano")


TodoCache.server_process(cache_pid, :pedro)
|> TodoService.get_many
|> IO.inspect