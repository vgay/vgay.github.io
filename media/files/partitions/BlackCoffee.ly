\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Black Coffee"
composer = #"Sonny Burke"
meter = #"(Bluesy Ballad)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s8 f2:9+ ges:9+ f2:9+ ges:9+ f2:9+ ges:9+ f2:9+ b:13
  bes1:9 s f2:9+ ges:9+ f:9+ d:9+
  g1:m7 g:m7/f f2:9+ d:9+ g:m7 c:9+
  f2:9+ ges:9+ f2 b:5+7
  bes2:m7 es:7 f1:m
  g2:m5-7 c:9- f1:7+  as2:m7 des:7 ges:7+ es:m7
  as:m7 des:7 g:m7 c:7
  f2:9+ ges:9+ f2:9+ ges:9+ f2:9+ ges:9+ f2:9+ b:13
  bes1:9 s f2:7+ g:m7 a:m7 as:7 g1:m7 g:m7/c f2:9+ ges:9+ f:9+
  \parenthesize ges:9+
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  \partial 8 c8
  \repeat volta 2 {
    f f f c es c4. | f8 f f c es4. c8 |
    f f f c es es es c | f f f c es4 f | \break
    as8 d,4. ~ d2 | \times 2/3 { r4 c' bes } \times 2/3 { as f d } |
    c1 ~ | c2. r8 c | \break
    g' a bes c a f4. | r8 \parenthesize d d as'8 g4 f8 f ~ |
  }
  \alternative {
    { f1~ | f2. r8 c8 }
    { f1 \repeatTie ~ | }
  }
  f2 r4 f8 f
  \bar "||" \break
  bes c bes as bes4. c8 | as8 f4. ~ f4. f8 |
  bes c  bes c des4 es | c2.. c8 |  \break
  des des des des des4. es8 | des des4. ~ des bes8 |
  des des des des des,4. des'8 | \times 2/3 { c c c } c c c,4. c8
  \bar "||" \break
  f f f c es c4. | f8 f f c es4. c8 |
  f f f c es es es c | f f f c es4 f | \break
  as8 d,4. ~ d2 | \times 2/3 { r4 c' bes } \times 2/3 { as f d } |
  c1 | r8 d \tuplet 3/2 { f a c } es es4 d8 | \break
  bes a bes c a f4. | r8 d f as g4 f8 f~ | f1~ | f2 r
  \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \bar "[|:" \repeat percent 3 { f2:9+ ges:9+ } f2:9+ b:13 \break
  \repeat percent 4 { bes1:9 } \break
  g:m7 g:m7/f \set Score.repeatCommands = #'((volta "1.") ) f2:9+ d:9+ g:m7 c:9+
  \set Score.repeatCommands = #'((volta #f)) \break \bar ":|]"
  \stopStaff s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2.") )
  f2:9+ ges:9+ f b:5+7 \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
  bes:m7 es:7 f1:m g2:m5-7 c:9- f1:7+ \break
  as2:m7 des:7 ges:7+ es:m7 as2:m7 des:7 g:m7 c:7  \bar "||" \break
  \repeat percent 3 { f2:9+ ges:9+ } f2:9+ b:13 \break
  \repeat percent 4 { bes1:9 } \break
  g:m7 g:m7/f \repeat unfold 2 { f2:9+ ges:9+ }
  \bar ".." }

verse = \lyricmode {
  I'm fee -- lin' might -- y lone -- some
  Ha -- ven't slept a wink
  I walk the floor and watch the door
  And in bet -- ween I drink
  Black Cof -- fee __
  Love's a hand me down brew __
  I'll ne -- ver know a Sun -- day
  { \skip 1 } In this week -- day room __ I'm

  \repeat unfold 3 { { \skip 1 } } man is born to go a lo -- vin' __
  A wo -- man's born to weep and fret
  To stay at home and tend her o -- ven __
  And drown her past re -- grets
  In cof -- fee and ci -- ga -- rettes

  I'm moo -- dy all the mor -- ning
  Mour -- ning all the night
  And in bet -- ween it's ni -- co -- tine
  And not much hard to fight
  Black Cof -- fee __
  Fee -- lin' low as the ground
  It's dri -- ving me cra -- zy just wait -- in' for my ba -- by
  To may -- be come a -- round __

  % My nerves have gone to pieces
  % My hair is turning gray
  % All I do is drink black coffee
  % Since my man's gone away

}

verseB = \lyricmode {
  { \skip 1 } tal -- kin' to the sha -- dows
  One o' -- clock to four
  And Lord, how slow the mo -- ments go
  When all I do is pour
  Black Cof -- fee __
  Since the blues caught my eye __
  I'm han -- gin' out on Mon -- day
  My Sun -- day dreams to dry __ \repeat unfold 2 { { \skip 1 } }  Now a
}

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    system-system-spacing = #'((basic-distance . 18)
                               (minimum-distance . 15)
                               (padding . 0))
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    system-system-spacing = #'((basic-distance . 18)
                               (minimum-distance . 15)
                               (padding . 0))
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    system-system-spacing = #'((basic-distance . 18)
                               (minimum-distance . 15)
                               (padding . 0))
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          \transpose c a, \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     %page-count = #1
%   }
%   #(define output-suffix "BassTab")
%   %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa } <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
% } }
%
% \book {
%   \paper {
%     #(set-paper-size "a4")
%     %page-count = #1
%   }
%   #(define output-suffix "Bassa4")
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa }
%         <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \\grille
% } } }

% \book {
%   %\paper { %page-count = #1
%	#(set-paper-size "a4")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSa4")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \transpose c a \grille
% } } }

% \book {
%   %\paper { %page-count = #2
%	#(set-paper-size "tablette")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSTab")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
% } } }