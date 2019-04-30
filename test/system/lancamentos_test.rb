require "application_system_test_case"

class LancamentosTest < ApplicationSystemTestCase
  setup do
    @lancamento = lancamentos(:one)
  end

  test "visiting the index" do
    visit lancamentos_url
    assert_selector "h1", text: "Lancamentos"
  end

  test "creating a Lancamento" do
    visit lancamentos_url
    click_on "New Lancamento"

    fill_in "Categoria", with: @lancamento.categoria_id
    fill_in "Data", with: @lancamento.data
    fill_in "Descricao", with: @lancamento.descricao
    fill_in "Nome", with: @lancamento.nome
    fill_in "Tipo", with: @lancamento.tipo_id
    fill_in "Valor", with: @lancamento.valor
    click_on "Create Lancamento"

    assert_text "Lancamento was successfully created"
    click_on "Back"
  end

  test "updating a Lancamento" do
    visit lancamentos_url
    click_on "Edit", match: :first

    fill_in "Categoria", with: @lancamento.categoria_id
    fill_in "Data", with: @lancamento.data
    fill_in "Descricao", with: @lancamento.descricao
    fill_in "Nome", with: @lancamento.nome
    fill_in "Tipo", with: @lancamento.tipo_id
    fill_in "Valor", with: @lancamento.valor
    click_on "Update Lancamento"

    assert_text "Lancamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Lancamento" do
    visit lancamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lancamento was successfully destroyed"
  end
end
