defmodule TransactionManagerTest do
    use ExUnit.Case
  
    doctest TransactionManager
  
    test "WHEN sku is 0 transaction SHOULD be invalid" do
      {:ok, pid} = TransactionManager.create([sku: 0])

      :timer.sleep(1)

      transaction = TransactionManager.get(pid)
      
      assert transaction[:status] == :invalid
    end

    test "WHEN sku is not 0 transaction SHOULD be valid" do
        {:ok, pid} = TransactionManager.create([sku: 1])
      
        :timer.sleep(1)
        
        transaction = TransactionManager.get(pid)
  
        assert transaction[:status] == :valid
    end
  end
  