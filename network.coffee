command: "./network.sh"

refreshFrequency: 5000

style: """
  bottom: 10px
  right: 10px
  color: #fff
  font-family: Helvetica Neue


  table
    border-collapse: collapse
    table-layout: fixed

    &:before
      content: 'network'
      position: absolute
      right: 0
      top: -14px
      font-size: 10px

  td
    background: rgba(#000, 0.2)
    border: 1px solid #fff
    font-size: 24px
    font-weight: 100
    width: 200px
    overflow: hidden
    text-shadow: 0 0 1px rgba(#000, 0.5)

  .wrapper
    padding: 4px 6px 4px 6px
    position: relative

  p
    padding: 0
    margin: 0
    font-size: 11px
    font-weight: normal
    max-width: 100%
    color: #ddd
    text-overflow: ellipsis

  .svc
    position: absolute
    top: 2px
    right: 2px
    font-size: 10px
    font-weight: normal
    text-transform: capitalize
"""

render: ->
  """
  <table class="network-info">
    <tr>
      <td class='col1'></td>
      <td class='col2'></td>
    </tr>
  </table>
  """

update: (output, domEl) ->
  nets = JSON.parse output
  table     = $(domEl).find('.network-info')

  renderNet = (svc) -> """
    <div class='wrapper'>
      #{svc.ipaddress}<p>#{svc.macaddress}</p>
      <div class='svc'>#{svc.name}</div>
    </div>
  """

  for svc, idx in nets.service
    svc.ipaddress = if svc.ipaddress == '' then 'Not Connected' else svc.ipaddress
    svc.macaddress = if svc.macaddress == '' then 'Not Connected' else svc.ipaddress
    table.find(".col#{idx+1}").html renderNet(svc)
