# Hello Docker action

This action prints "Hello" + the name of a person to greet to the log.

## Inputs

### `whoToGreet`

**Required** The name of the person to greet.

## Outputs

### `time`

The time I greeted you.

## Example using a public action

```yaml
name: Public action workflow
on: [push]

jobs:
  hello_job:
    runs-on: ubuntu-latest
    name: A job to say hello
    steps:
    - name: Hello action step
      id: hello
      uses: actions/hello-docker-action@v1
      with:
        whoToGreet: 'Arsène Lupin'
    - name: Get the output time
      run: echo "The time was ${{ steps.hello.outputs.time }}"
```

## Example using a private action

```yaml
name: Private action workflow
on: [push]

jobs:
  hello_job:
    runs-on: ubuntu-latest
    name: A job to say hello
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Hello action step
      id: hello
      uses: ./
      with:
        whoToGreet: 'Arsène Lupin'
    - name: Get the output time
      run: echo "The time was ${{ steps.hello.outputs.time }}"
```