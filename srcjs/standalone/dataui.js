import { Children } from 'react'
import {Histogram, BarSeries, DensitySeries, XAxis, YAxis } from '@data-ui/histogram';
import {
  Sparkline as Sparkline,
  LineSeries as SparklineLineSeries,
  PointSeries as SparklinePointSeries,
  BarSeries as SparklineBarSeries,
  HorizontalReferenceLine as HorizontalReferenceLine,
  VerticalReferenceLine as VerticalReferenceLine,
  BandLine as BandLine,
  PatternLines as PatternLines,
  LinearGradient as LinearGradient,
  Label as Label,
  WithTooltip as WithTooltip,
  withParentSize as withParentSize
} from '@data-ui/sparkline';

// copied from https://github.com/williaster/data-ui/blob/master/packages/sparkline/src/utils/componentIsX.js
const componentName = function(component) {
  if (component && component.type) {
    return component.type.displayName || component.type.name || 'Component';
  }

  return '';
}

class SparklineResponsiveComponent extends React.PureComponent {
  constructor(props) {
    super(props);
  }

  render() {
    const propsChangedSize = {...this.props, ...{width:this.props.parentWidth}}
    return <SparklineWithTooltip {...propsChangedSize} />
  }
}

const SparklineResponsive = withParentSize(SparklineResponsiveComponent);

const SparklineWithTooltip = props => {
  return (
    <WithTooltip renderTooltip = {props.renderTooltip}>
      {({ onMouseMove, onMouseLeave, tooltipData }) => {
        let tooltipCopy = null;
        if (typeof tooltipData !== "undefined") {
          tooltipCopy = Object.assign(
            {},
            {
              index: tooltipData.index,
              datum: tooltipData.datum,
              data: tooltipData.data
            }
          );
        }

        let { children, ...propsNoChildren } = props

        return (
          <Sparkline
            {...propsNoChildren}
            onMouseLeave={onMouseLeave}
            onMouseMove={onMouseMove}
          >
            {
              Children.map(children, Child => {
                const name = componentName(Child);
                return React.cloneElement(
                  Child,
                  {tooltipData: tooltipCopy}
                );
              })
            }
          </Sparkline>
        );
      }}
    </WithTooltip>
  );
};

const TooltipComponent = (props) => {

  const {
    children,
    xScale,
    yScale,
    data,
    getX,
    getY,
    margin,
  } = props;

  const seriesProps = {
    xScale,
    yScale,
    data,
    getX,
    getY,
    margin,
  };

  if(typeof(props.tooltipData) !== "undefined" && props.tooltipData !== null) {
    return Children.map(props.children, Child => {
      const name = componentName(Child);
      if(name === "VerticalReferenceLine") {
        return React.cloneElement(
          Child,
          Object.assign({},seriesProps,{reference: props.tooltipData.index})
        );
      }
      if(name === "ReferenceLine") {
        return React.cloneElement(
          Child,
          Object.assign({},seriesProps,{reference: props.tooltipData.datum.y})
        );
      }
      if(/pointseries/gi.test(name)) {
        return React.cloneElement(
          Child,
          Object.assign({},seriesProps,{points: [props.tooltipData.index]})
        );
      }
      return Child
    })
  }

  return null
}

TooltipComponent.displayName = "referencelinetooltip"

export {
  Histogram, BarSeries, DensitySeries, XAxis, YAxis,
  Sparkline,
  SparklineLineSeries,
  SparklinePointSeries,
  SparklineBarSeries,
  HorizontalReferenceLine,
  VerticalReferenceLine,
  BandLine,
  PatternLines,
  LinearGradient,
  Label,
  WithTooltip,
  SparklineWithTooltip,
  SparklineResponsive,
  withParentSize,
  TooltipComponent
}

