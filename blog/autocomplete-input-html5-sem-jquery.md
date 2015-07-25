## Como criar um autocomplete nativo do HTML5 sem usar jQuery

Neste pequeno post vamos ver como criar um **input** com autocomplete sem utilizar jQuey ou JavaScript.

**Exemplo**:

<p>
  <label>
    <input list="minhaLista" placeholder="Digite um mês do ano">
    <datalist id="minhaLista">
      <option>Janeiro</option>
      <option>Fevereiro</option>
      <option>Março</option>
      <option>Abril</option>
      <option>Maio</option>
      <option>Junho</option>
      <option>Julho</option>
      <option>Agosto</option>
      <option>Setembro</option>
      <option>Outubro</option>
      <option>Novembro</option>
      <option>Dezembro</option>
    </datalist>
  </label>
</p>

Basta digitar no campo um mês do ano para ver a sugestão de autocomplete aparecer.

## Como funciona

Vamos adicionar no nosso **input** um atributo **list** e passar como valor o **id** do nosso elemento **datalist**.

```html
<input list="minhaLista">

<datalist id="minhaLista">
  <option>Janeiro</option>
  <option>Fevereiro</option>
  <option>Março</option>
  <option>Abril</option>
  <option>Maio</option>
  <option>Junho</option>
  <option>Julho</option>
  <option>Agosto</option>
  <option>Setembro</option>
  <option>Outubro</option>
  <option>Novembro</option>
  <option>Dezembro</option>
</datalist>
```

Bem simples né!?

