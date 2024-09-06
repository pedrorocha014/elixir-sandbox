defmodule TransactionManager do
    use GenServer

    # client

    def create(default) do
        GenServer.start_link(__MODULE__, default)
    end

    def get(pid) do
        GenServer.call(pid, :get)
    end

    # server

    def init([sku: sku]) do
        initial_state = %{id: :rand.uniform(100), sku: sku, status: :pending}
        Process.send_after(self(), :validate, 0)

        {:ok, initial_state}
    end

    def handle_call(:get, _from, state) do
        {:reply, state, state}
    end

    def handle_info(:validate, %{sku: 0} = state) do
        {:noreply, %{ state | status: :invalid }}
    end

    def handle_info(:validate, state) do
        {:noreply, %{ state | status: :valid }}
    end
end