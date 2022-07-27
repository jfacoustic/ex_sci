defmodule ExSci.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_sci,
      version: "0.0.1",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ExSci",
      source_url: "https://github.com/jfacoustic/ex_sci",
      description: description(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    """
    Scientific Library for Elixir
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      maintainers: ["Joshua F. Mathews"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jfacoustic/ex_sci"}
    ]
  end
end
